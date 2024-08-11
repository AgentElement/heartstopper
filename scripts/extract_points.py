# Convert ergogen's points.yaml into an openscad-readable array
# usage: python -m scripts.extract_points.py > scad/points.scad

import yaml

BUILD_DIRECTORY = "build"

def main():
    yamlfile = f"{BUILD_DIRECTORY}/points.yaml"
    with open(yamlfile) as file:
        contents = file.read()

    contents = yaml.safe_load(contents)

    outputs = {}
    for key, val in contents.items():
        outputs[key] = [val['r'], val['x'], val['y']] 

    prefix = '// theta, x, y\npoints = [\n'
    postfix = '];'
    lst = "".join(f"    {str(v)},\n" for v in outputs.values())

    print(prefix, lst, postfix)



if __name__ == "__main__":
    main()
