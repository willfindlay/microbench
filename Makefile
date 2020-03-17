SRC = src
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
	@sh/results.sh $(TRIALS)

$(BIN)/null: $(SRC)/null.c
	@mkdir -p $(BIN)
	gcc -O2 -o $(BIN)/null $(SRC)/null.c

$(BIN)/simple: $(SRC)/simple.c
	@mkdir -p $(BIN)
	gcc -O2 -o $(BIN)/simple $(SRC)/simple.c

$(BIN)/system: $(SRC)/system.c
	@mkdir -p $(BIN)
	gcc -O2 -o $(BIN)/system $(SRC)/system.c

