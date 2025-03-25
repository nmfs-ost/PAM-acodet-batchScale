import os
import io
import yaml

# Read YAML file
with open("simple_config.yml", 'r') as stream:
    data = yaml.safe_load(stream)

for name, value in os.environ.items():
    #load it into the humpback detector. Possible (do if needed), make sure names match possible values. 
    #replace values in yaml with parameters
    #import code
    #code.interact(local=dict(globals(), **locals()))

    #convention
    name = name.lower()

    if name in data:
        print(f"ENV variable with {name} found in simple config")
        #determine previous type
        _type = type(data[name])

        #coerce value to type. If errors, it's for a good reason.
        try:
            data[name] = _type(value)
        except ValueError:
            print(f"Cannot convert {value} for ENV variable {name} to {str(_type)}")
    
# Write YAML file
with io.open("simple_config.yml", 'w', encoding='utf8') as outfile:
    yaml.dump(data, outfile, default_flow_style=False, allow_unicode=True)