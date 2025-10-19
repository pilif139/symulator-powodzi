# makefile
.PHONY: all configure build clean run

all: build

configure:
	mkdir -p cmake-build-debug
	cmake -S . -B cmake-build-debug -DCMAKE_BUILD_TYPE=Debug

build: configure
	cmake --build cmake-build-debug -- -j$$(sysctl -n hw.ncpu)

run: build
	./cmake-build-debug/symulator_powodzi

clean:
	rm -rf cmake-build-debug

rebuild: clean all

build-release:
	mkdir -p cmake-build-release
	cmake -S . -B cmake-build-release -DCMAKE_BUILD_TYPE=Release
	cmake --build cmake-build-release -- -j$$(sysctl -n hw.ncpu)

run-release: build-release
	./cmake-build-release/symulator_powodzi