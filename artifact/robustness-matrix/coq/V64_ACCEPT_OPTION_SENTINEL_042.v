(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_042.
Definition enc_102 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_102 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_102 : forall o, dec_102 (enc_102 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_102 : forall o, enc_102 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_042.

