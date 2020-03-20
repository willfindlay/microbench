SRC = src
BIN = bin
RESULTS = results
TRIALS = 1000

.PHONY: all clean mrproper results

all: $(BIN)/fork $(BIN)/forkexec $(BIN)/system

clean:
	@rm -rf $(BIN)

mrproper: clean
	@rm -rf $(RESULTS)/*

results: all
	@sh/results.sh $(TRIALS)

$(BIN)/fork: $(SRC)/fork.c
	@mkdir -p $(BIN)
	gcc -O2 -o $(BIN)/fork $(SRC)/fork.c

$(BIN)/forkexec: $(SRC)/forkexec.c
	@mkdir -p $(BIN)
	gcc -O2 -o $(BIN)/forkexec $(SRC)/forkexec.c

$(BIN)/system: $(SRC)/system.c
	@mkdir -p $(BIN)
	gcc -O2 -o $(BIN)/system $(SRC)/system.c

