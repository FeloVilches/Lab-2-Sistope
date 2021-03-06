DIR_OUTPUT = ./bin
DIR_SRC = ./src
NOMBRE_MAIN = competencia
LIB = lib
OBJ = $(DIR_OUTPUT)/lista.o $(DIR_OUTPUT)/grupohilo.o $(DIR_OUTPUT)/lib.o $(DIR_OUTPUT)/monitor.o
FLAG = -Wall

all: dir main cleanobj

dir: 
# Crear el directorio "bin"
	mkdir -p $(DIR_OUTPUT)

main: lib.o monitor.o lista.o grupohilo.o
# Compilar el main
	gcc $(OBJ) $(DIR_SRC)/$(NOMBRE_MAIN).c -o $(DIR_OUTPUT)/$(NOMBRE_MAIN) -pthread $(FLAG)
	@echo ""
	@echo "*******************************"
	@echo "Ingresar a la carpeta $(DIR_OUTPUT)"
	@echo "Ejecutar ./$(NOMBRE_MAIN) usando los argumentos descritos en el enunciado o README"
	@echo "*******************************"
	@echo ""

debug: dir lib.o monitor.o lista.o grupohilo.o
# Compilar el main
	gcc -g $(OBJ) $(DIR_SRC)/$(NOMBRE_MAIN).c -o $(DIR_OUTPUT)/$(NOMBRE_MAIN) -pthread $(FLAG)

lista.o:
	gcc -c $(DIR_SRC)/$(LIB)/lista.c -o $(DIR_OUTPUT)/lista.o $(FLAG)

grupohilo.o:
	gcc -c $(DIR_SRC)/$(LIB)/grupohilo.c -o $(DIR_OUTPUT)/grupohilo.o $(FLAG)

monitor.o:
	gcc -c $(DIR_SRC)/$(LIB)/monitor.c -o $(DIR_OUTPUT)/monitor.o $(FLAG)

lib.o:
	gcc -c $(DIR_SRC)/$(LIB)/lib.c -o $(DIR_OUTPUT)/lib.o $(FLAG)

clean:
	rm -rf $(DIR_OUTPUT)/*

cleanobj:
	rm -rf $(DIR_OUTPUT)/*.o