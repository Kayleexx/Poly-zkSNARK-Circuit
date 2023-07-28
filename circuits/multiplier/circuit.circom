pragma circom 2.0.0;

template CustomCircuit () {  

  // Signal inputs
  signal input a;
  signal input b;

  // Signals from gates
  signal x;
  signal y;

  // Component gates used to create a custom circuit
  component andGate = AND();
  component notGate = NOT();
  component orGate = OR();

  // Circuit logic
  andGate.A <== a;
  andGate.B <== b;
  x <== andGate.X; // Connect the AND gate output to x

  notGate.B <== x;
  y <== notGate.Y; // Connect the NOT gate output to y

  orGate.X <== a; // Connect OR gate input X to signal 'a'
  orGate.Y <== b; // Connect OR gate input Y to signal 'b'
}

template AND() {
  signal input A;
  signal input B;
  signal output X;

  X <== A*B;
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

  Q <== X + Y - X*Y;
}

component main = CustomCircuit();

