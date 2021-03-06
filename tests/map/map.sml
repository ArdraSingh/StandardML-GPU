val [x] = CommandLine.arguments()
val SOME(size) = Int.fromString x
structure Seq = ArraySequence
structure GPUSeq = INTGPUSequence

val a1 = Seq.tabulate(fn i => 1) size

fun run () = 
  let
    val a = Seq.map (fn i => 2 * i) a1
    val a = Seq.map (fn i => 2 * i) a
    val a = Seq.map (fn i => 2 * i) a
    val a = Seq.map (fn i => 2 * i) a
    val a = Seq.map (fn i => 2 * i) a
    val a = Seq.map (fn i => 2 * i) a
    val a = Seq.map (fn i => 2 * i) a
  in
    a
  end

val (a1, str1) = Timer.run run
val _ = print("SML : " ^ str1 ^ "\n")
val a2 = GPUArray.initInt size 1

fun run () = 
  let
    val a = GPUSeq.map GPUINTLambdas.double a2
    val a = GPUSeq.map GPUINTLambdas.double a
    val a = GPUSeq.map GPUINTLambdas.double a
    val a = GPUSeq.map GPUINTLambdas.double a
    val a = GPUSeq.map GPUINTLambdas.double a
    val a = GPUSeq.map GPUINTLambdas.double a
    val a = GPUSeq.map GPUINTLambdas.double a
  in
    a
  end


val (res2, str2) = Timer.run run
val _ = print("SMLGPU : " ^ str2 ^ "\n")
val arr = GPUArray.toIntArray res2
(*val _ = print(Printer.arrayToString Int.toString arr ^ "\n")*)
val a3 = GPUSeq.toArraySequence res2
val wei = Seq.length (Seq.filter (fn x => x = 128) a3)
val _ = if wei = size then print("Success!\n") else print("Test Failed\n")

