namespace TMIOS.Sandbox.BareStack

def SandboxReady : Prop := True

theorem sandbox_ready : SandboxReady := by
  trivial

theorem guarded_action_from_ready : SandboxReady -> SandboxReady := by
  intro h
  exact h

end TMIOS.Sandbox.BareStack
