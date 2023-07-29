pragma circom 2.0.0;

template CustomCircuit () {  

  // Signal inputs
  signal input A;
  signal input B;

  // Signals from gates
  signal X;
  signal Y;

  // Component gates used to create a custom circuit
  component andGate = AND();
  component notGate = NOT();
  component orGate = OR();

  // Circuit logic
  andGate.A <== A;
  andGate.B <== B;
  X <== andGate.X; // Connect the AND gate output to X

  notGate.B <== B;
  Y <== notGate.Y; // Connect the NOT gate output to Y

  orGate.X <== X; // Connect OR gate input X to signal 'X'
  orGate.Y <== Y; // Connect OR gate input Y to signal 'Y'

  // final output signal Q is connected to the output of the OR gate
  Q <== orGate.Q;
}

template AND() {
  signal input A;
  signal input B;
  signal output X;

  X <== A * B;
}

template NOT() {
  signal input B;
  signal output Y;

  Y <== 1 - B;
}

template OR() {
  signal input X;
  signal input Y;
  signal output Q;

  Q <== X + Y - X * Y;
}

component main = CustomCircuit();


