SRC	 := ./cmd
BIN  := ./build/bin/go-learning

all:
	go build -o $(BIN) $(SRC)

clean:
	rm -rf $(BIN)

.PHONY: all clean

.DEFAULT_GOAL: all