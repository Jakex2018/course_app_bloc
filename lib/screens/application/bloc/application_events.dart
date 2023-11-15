abstract class ApplicationEvent {
  const ApplicationEvent();
}

class TriggerApplicationEvent extends ApplicationEvent{
  final int index;
  TriggerApplicationEvent(this.index):super();
}