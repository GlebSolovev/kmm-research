#!/usr/bin/env python3

from llvmlite import binding as llvm


def print_mod(m):
    print(repr(m))
    print(m)


def print_fun_by_get(m, f):
    func = m.get_function(f)
    print(func)


def print_fun_via_iteration(m, f):
    for function in m.functions:
        if function.name == f:
            for block in function.blocks:
                print(block)


def inspect_fun(fun_name):
    for f in mod.functions:
        if f.name != fun_name:
            continue
        print(f'Function: {f.name}/`{f.type}`')
        assert f.module is mod
        assert f.function is None
        assert f.block is None
        assert f.is_function and not (f.is_block or f.is_instruction)
        print(f'Function attributes: {list(f.attributes)}')
        for a in f.arguments:
            print(f'Argument: {a.name}/`{a.type}`')
            print(f'Argument attributes: {list(a.attributes)}')
        for b in f.blocks:
            # print(f'Block: {b.name}/`{b.type}`\n{b}\nEnd of Block')
            assert b.module is mod
            assert b.function is f
            assert b.block is None
            assert b.is_block and not (b.is_function or b.is_instruction)
            for i in b.instructions:
                if i.opcode != 'call':
                    continue
                print(f'Instruction: {i.name}/`{i.opcode}`/`{i.type}`: `{i}`')
                print(f'Attributes: {list(i.attributes)}')
                assert i.module is mod
                assert i.function is f
                assert i.block is b
                assert i.is_instruction and not (i.is_function or i.is_block)
                for o in i.operands:
                    print(f'Operand: {o.name}/{o.type}')


llvm.initialize()
llvm.initialize_native_target()
llvm.initialize_native_asmprinter()

ll_file = 'testBitcode/unordered.ll'
bc_file = 'testBitcode/out.bc'

main_fun = 'kfun:#main(kotlin.Array<kotlin.String>){}'
int_array_lambda_fun = 'kfun:RingLauncher.$<init>$lambda$110$FUNCTION_REFERENCE$220.invoke#internal'

# with open(bc_file, 'rb') as file:
#     bitcode = file.read()

with open(ll_file, 'r') as file:
    bitcode = file.read()

mod = llvm.parse_assembly(bitcode)

mod.verify()

inspect_fun(main_fun)
inspect_fun(int_array_lambda_fun)

llvm.shutdown()
