(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_053.
Definition enc_113 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_113 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_113 : forall o, dec_113 (enc_113 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_113 : forall o, enc_113 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_053.

