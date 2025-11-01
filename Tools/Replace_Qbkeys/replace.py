import re
import sys
import os

def load_keylist(path='keylist.txt'):
    key_map = {}
    if not os.path.isfile(path):
        print(f"❌ Keylist file not found: {path}")
        sys.exit(1)

    with open(path, 'r') as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith('#'):
                continue

            parts = line.split(maxsplit=1)
            if len(parts) != 2:
                print(f"⚠️ Skipping malformed line in keylist: {line}")
                continue

            key, name = parts
            key_map[key.lower()] = name
    return key_map

def lookup_checksum(hex_str, key_map):
    key = hex_str.lower()
    if key in key_map:
        return key_map[key]
    # If it's 7 digits, pad with leading zero
    if re.match(r'0x[0-9a-fA-F]{7}$', key):
        padded_key = '0x0' + key[2:]
        return key_map.get(padded_key, hex_str)
    return hex_str

def process_content(content, key_map):
    # Match %0x...% or <0x...>
    pattern = re.compile(r'(%0x[0-9a-fA-F]{7,8}%|<0x[0-9a-fA-F]{7,8}>)')

    def replace_match(match):
        text = match.group(0)

        if text.startswith('%') and text.endswith('%'):
            raw_key = text.strip('%')
            return lookup_checksum(raw_key, key_map)

        elif text.startswith('<') and text.endswith('>'):
            inner = text[1:-1]
            replaced = lookup_checksum(inner, key_map)
            return f'<{replaced}>'

        return text

    return pattern.sub(replace_match, content)

def main():
    if len(sys.argv) != 3:
        print("Usage: python replace.py input_script output_script")
        sys.exit(1)

    input_file = sys.argv[1]
    output_file = sys.argv[2]

    if not os.path.isfile(input_file):
        print(f"❌ Input file not found: {input_file}")
        sys.exit(1)

    key_map = load_keylist()

    with open(input_file, 'r') as f:
        content = f.read()

    replaced_content = process_content(content, key_map)

    with open(output_file, 'w') as f:
        f.write(replaced_content)

    print(f"Done. Output written to {output_file}")

if __name__ == '__main__':
    main()