operation SampleRandomNumberInRange(max : Int) : Int{
	mutable bits = new Result[0];
	for(idxBit in 1..BitSize(max)){
		set bits += [SampleQuantumRandomNumberGenerator()];
	}
	let sample = ResultArrayAsInt(bits);
	return sample > max
			? SampleRandomNumberInRange(max) | sample;
}

@EntryPoint()
operation SampleRandomNumber(): Int {
	let max = 50;
	Message($"Sampling a random number between 0 and {max}: ");
	return SampleRandomNumberInRange(max);
}