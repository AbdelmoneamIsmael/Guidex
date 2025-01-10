enum GeneratorStatus {
  off, // Generator is turned off
  running, // Generator is running and operational
  fault, // Generator has encountered a fault or error
  maintenance, // Generator is undergoing maintenance
  starting, // Generator is in the process of starting up
  stopping, // Generator is in the process of shutting down
  idle, // Generator is on but not generating power
  overload // Generator is overloaded
}
