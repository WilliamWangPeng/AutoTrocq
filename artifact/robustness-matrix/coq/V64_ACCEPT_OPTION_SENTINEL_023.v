(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_023.
Definition enc_83 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_83 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_83 : forall o, dec_83 (enc_83 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_83 : forall o, enc_83 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_023.

