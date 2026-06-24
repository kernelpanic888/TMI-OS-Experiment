namespace TMIOS.Experiment.BareStack

def ExperimentReady : Prop := True

theorem experiment_ready : ExperimentReady := by
  trivial

theorem guarded_action_from_ready : ExperimentReady -> ExperimentReady := by
  intro h
  exact h

end TMIOS.Experiment.BareStack
