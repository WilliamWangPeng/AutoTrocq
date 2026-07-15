(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_021.
Definition enc_81 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_81 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_81 : forall o, dec_81 (enc_81 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_81 : forall o, enc_81 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_021.

