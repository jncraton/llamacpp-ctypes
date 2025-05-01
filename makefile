all: build llama.h

build:
	wget https://github.com/ggml-org/llama.cpp/releases/download/b5210/llama-b5210-bin-ubuntu-x64.zip
	unzip *.zip

llama.py:
	ctypesgen -llibllama.so -I llama.cpp/ggml/include -I . llama.cpp/include/llama.h -o llama.py

llama.cpp:
	git clone --depth=1 https://github.com/ggml-org/llama.cpp

clean:
	rm -rf build llama.cpp
	rm -f *.zip
	rm -f llama.h
	rm -f llama.py
	rm -f libllama.so
