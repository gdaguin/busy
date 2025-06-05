class TimeoutConfig {
  final Duration duration;
  final void Function()? onTimeout;

  TimeoutConfig(this.duration, {this.onTimeout});
}
