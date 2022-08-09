abstract class CounterState{}
class CounterInitialState extends CounterState{}
class CounterMinusState extends CounterState
{
  final int counter;

  CounterMinusState(this.counter);
}
class CounterPlusState extends CounterState
{
  final int counter;

  CounterPlusState(this.counter);
}
