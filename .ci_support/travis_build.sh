# build script of Mac OS X on Travis CI

if [ ! -f build_script_osx-64.sh ]; then
    echo "Creating build script from YAML file"
    python create_build_script.py build_specs.yml osx-64 > build_script_osx-64.sh
    chmod +x build_script_osx-64.sh
fi
./build_script_osx-64.sh
