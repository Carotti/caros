iso/caros.iso: bin/caros.bin grub/grub.cfg
	@grub-file --is-x86-multiboot bin/caros.bin || (echo "Multiboot check failed"; exit 1)
	@mkdir -p iso iso/dir iso/dir/boot iso/dir/boot/grub
	@cp grub/grub.cfg iso/dir/boot/grub/grub.cfg
	@cp bin/caros.bin iso/dir/boot/caros.bin
	@grub-mkrescue -o iso/caros.iso iso/dir

bin/caros.bin: obj/kernel.o obj/boot.o
	@mkdir -p bin/
	@i686-elf-gcc -T linker.ld -o $@ -ffreestanding -O2 -nostdlib $^ -lgcc -static

clean:
	@rm -rf iso/
	@rm -rf bin/
	@rm -rf obj/

obj/kernel.o: src/kernel.cpp
	@mkdir -p obj
	@i686-elf-g++ -c $^ -o $@ -ffreestanding -O2 -Wall -Wextra -fno-exceptions -fno-rtti

obj/boot.o: src/boot.asm
	@i686-elf-as $^ -o $@
