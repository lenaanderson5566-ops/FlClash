"""Render the native FastDog glyph into FastAI launcher/tray assets (Pillow)."""
from pathlib import Path
import math
import re
from PIL import Image, ImageDraw

ROOT = Path(__file__).resolve().parent.parent
PATHS = [
    'M7 9 L4 5 Q2 4 3 10 L5 15 M17 9 L20 5 Q22 4 21 10 L19 15',
    'M7 7 Q12 4 17 7 L19 14 Q20 20 12 21 Q4 20 5 14 Z',
    'M10 16 Q12 14 14 16 L12 18 Z',
]


def lines(path):
    tokens = re.findall(r'[MLQZ]|\d+', path)
    result, points, current = [], [], (0, 0)
    index = 0
    while index < len(tokens):
        command = tokens[index]
        index += 1
        if command == 'Z':
            points.append(points[0])
            continue
        count = 4 if command == 'Q' else 2
        values = list(map(float, tokens[index:index + count]))
        index += count
        end = tuple(values[-2:])
        if command == 'M':
            if points:
                result.append(points)
            points = [end]
        elif command == 'L':
            points.append(end)
        else:
            control = values[:2]
            for step in range(1, 33):
                t = step / 32
                points.append(tuple((1-t)**2 * current[d] + 2*(1-t)*t*control[d] + t*t*end[d] for d in [0, 1]))
        current = end
    result.append(points)
    return result


def icon(size, color='#E77732', template=False):
    scale = 4
    width = size * scale
    image = Image.new('RGBA', (width, width))
    draw = ImageDraw.Draw(image)
    if not template:
        points = []
        for step in range(720):
            angle = step * math.tau / 720
            x, y = math.cos(angle), math.sin(angle)
            points.append((width/2 + math.copysign(abs(x)**.4, x)*width*.48,
                           width/2 + math.copysign(abs(y)**.4, y)*width*.48))
        draw.polygon(points, fill=color)
    ink = '#000000' if template else '#FFF8F1'
    transform = lambda p: tuple((v*.72 + 3.36)*width/24 for v in p)
    for path in PATHS:
        for points in lines(path):
            stroke = max(1, round(width*.037))
            draw.line([transform(p) for p in points], fill=ink, width=stroke, joint='curve')
            for point in points:
                x, y = transform(point)
                radius = stroke / 2
                draw.ellipse((x-radius, y-radius, x+radius, y+radius), fill=ink)
    for x in [9, 15]:
        a, b = transform((x-.65, 11.35)), transform((x+.65, 12.65))
        draw.ellipse((*a, *b), fill=ink)
    return image.resize((size, size), Image.Resampling.LANCZOS)


def main():
    source = ROOT / 'assets/images/fastai.svg'
    source.write_text('<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><g fill="none" stroke="#E77732" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round">' + ''.join(f'<path d="{p}"/>' for p in PATHS) + '<circle cx="9" cy="12" r=".6" fill="#E77732"/><circle cx="15" cy="12" r=".6" fill="#E77732"/></g></svg>', encoding='utf-8')
    icon(1024).save(ROOT / 'assets/images/icon.png')
    for name in ['assets/images/icon.ico', 'windows/runner/resources/app_icon.ico']:
        icon(256).save(ROOT / name, sizes=[(n, n) for n in [16, 24, 32, 48, 64, 128, 256]])
    for file in (ROOT / 'macos/Runner/Assets.xcassets/AppIcon.appiconset').glob('*.png'):
        icon(int(file.stem.split('_')[-1])).save(file)
    for file in (ROOT / 'android/app/src/main/res').glob('mipmap-*/ic_launcher*.webp'):
        with Image.open(file) as original:
            size = original.width
        icon(size).save(file, lossless=True)
    icon(512).save(ROOT / 'android/app/ic_launcher-playstore.png')
    banner = Image.new('RGBA', (320, 180), '#FFF8F1')
    banner.alpha_composite(icon(144), (88, 18))
    banner.save(ROOT / 'android/app/src/main/res/mipmap-xhdpi/ic_banner.png')
    for file in (ROOT / 'assets/images/tray').rglob('*'):
        if file.suffix not in ['.png', '.ico']:
            continue
        with Image.open(file) as original:
            size = original.width
        status = int(file.stem[-1])
        image = icon(size, color={1:'#A7A19C', 2:'#E77732', 3:'#36A66A', 4:'#A7A19C'}[status], template='macos' in file.parts)
        image.save(file)
    foreground = '<vector xmlns:android="http://schemas.android.com/apk/res/android" android:width="108dp" android:height="108dp" android:viewportWidth="36" android:viewportHeight="36"><group android:translateX="6" android:translateY="6">' + ''.join(f'<path android:pathData="{p}" android:fillColor="#00000000" android:strokeColor="#FFF8F1" android:strokeWidth="1.25" android:strokeLineCap="round" android:strokeLineJoin="round"/>' for p in PATHS) + '<path android:fillColor="#FFF8F1" android:pathData="M8.4,12a0.6,0.6 0,1 0,1.2 0a0.6,0.6 0,1 0,-1.2 0 M14.4,12a0.6,0.6 0,1 0,1.2 0a0.6,0.6 0,1 0,-1.2 0"/></group></vector>'
    for name in ['ic_launcher_foreground.xml', 'ic_launcher_foreground_tv.xml']:
        (ROOT / 'android/app/src/main/res/drawable' / name).write_text(foreground, encoding='utf-8')
    (ROOT / 'android/app/src/main/res/values/ic_launcher_background.xml').write_text('<resources><color name="ic_launcher_background">#E77732</color></resources>', encoding='utf-8')


if __name__ == '__main__':
    main()
