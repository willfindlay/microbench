BIN = bin
RESULTS = results
TRIALS = 1000

.PHONY: all clean mrproper results

all: $(BIN)/null $(BIN)/simple $(BIN)/system

clean:
	@rm -rf $(BIN)

mrproper: clean
	@rm -rf $(RESULTS)/*

results: all
	@sh/results.sh

$(BIN)/null: null.c
	@mkdir -p $(BIN)
	gcc -O2 -o $(BIN)/null null.c

$(BIN)/simple: simple.c
	@mkdir -p $(BIN)
	gcc -O2 -o $(BIN)/simple simple.c

$(BIN)/system: system.c
	@mkdir -p $(BIN)
	gcc -O2 -o $(BIN)/system system.c

