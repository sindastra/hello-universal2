all: hello.universal

hello.universal: hello.x86_64 hello.arm64
	lipo -create -arch arm64 hello.arm64 -arch x86_64 hello.x86_64 -output hello.universal

hello.x86_64: hello.c
	clang -O2 hello.c -o hello.x86_64 -arch x86_64

hello.arm64: hello.c
	clang -O2 hello.c -o hello.arm64 -arch arm64

clean:
	rm -f hello.arm64 hello.x86_64 hello.universal
