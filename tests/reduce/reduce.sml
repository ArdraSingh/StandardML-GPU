val [x] = CommandLine.arguments()
val SOME(size) = Int.fromString x
structure Seq = ArraySequence
val a1 = Seq.tabulate(fn i => 1) size
val (res1, str1) = Timer.run (fn () => Seq.reduce (fn (x,y) => x) 0 a1)
val _ = print("SML : " ^ str1 ^ "\n")
val a2 = GPUArray.initInt size 1
val (res2, str2) = Timer.run (fn () => INTGPUSequence.reduce GPUINTLambdas.add 0 a2)
val _ = print("SMLGPU : " ^ str2 ^ "\n")
val _ = if res1 = res2 then print("Success!\n") else print("Test Failed\n")

