(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_034.
Definition enc_94 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_94 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_94 : forall o, dec_94 (enc_94 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_94 : forall o, enc_94 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_034.

