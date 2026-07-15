(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_054.
Definition enc_114 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_114 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_114 : forall o, dec_114 (enc_114 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_114 : forall o, enc_114 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_054.

