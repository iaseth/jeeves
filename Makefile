AMP = @

GCC = ${AMP}gcc
INCLUDE_FLAG = -Iinclude
LINK_FLAG = -lnone

RM = ${AMP}rm -f

JEEVES_NAMES = 
JEEVES_NAMES += jeeves_common

JEEVES_OBJ_NAMES = ${addsuffix .o, ${JEEVES_NAMES}}
JEEVES_OBJS = ${addprefix build/, ${JEEVES_OBJ_NAMES}}

MAIN_SRC = src/main.c
MAIN_OBJ = build/main.o

BIN = build/jeeves

default: ${BIN}

debug:
	${eval AMP := }

${MAIN_OBJ}: ${MAIN_SRC}
	${GCC} -c $< -o $@ ${INCLUDE_FLAG}

${JEEVES_OBJS}: build/%.o: src/%.c include/%.h
	${GCC} -c $< -o $@ ${INCLUDE_FLAG}

${BIN}: ${MAIN_OBJ} ${JEEVES_OBJS}
	${GCC} $^ -o $@

redo: clean default

run: ${BIN}
	@${BIN}

move:
	sudo cp ${BIN} /usr/bin

clean:
	${RM} ${BIN}
	${RM} ${MAIN_OBJ}
	${RM} ${JEEVES_OBJS}


