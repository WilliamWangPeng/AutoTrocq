(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_015.
Definition enc_75 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_75 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_75 : forall o, dec_75 (enc_75 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_75 : forall o, enc_75 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_015.

