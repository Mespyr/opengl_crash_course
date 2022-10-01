CPP=g++
CPPFLAGS=-Wall -Wextra -pedantic
LDFLAGS=-lglfw -lGL

SRC_DIR=src
OBJ_DIR=obj
INCLUDE_DIR=src/include
SRC_FILES=$(wildcard $(SRC_DIR)/*.cpp)
OBJ_FILES=$(patsubst $(SRC_DIR)/%.cpp, $(OBJ_DIR)/%.o, $(SRC_FILES))
HDR_FILES=$(wildcard $(INCLUDE_DIR)/*.h)
BIN=opengl_crash_course

all: $(BIN)

$(BIN): $(OBJ_FILES) $(OBJ_DIR)
	$(CPP) $(CPPFLAGS) $(OBJ_FILES) -o $@ $(LDFLAGS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp $(OBJ_DIR)
	$(CPP) $(CPPFLAGS) -c $< -o $@

$(OBJ_DIR):
	mkdir -p $@

clean:
	$(RM) -r $(OBJ_DIR)
	$(RM) $(BIN)
