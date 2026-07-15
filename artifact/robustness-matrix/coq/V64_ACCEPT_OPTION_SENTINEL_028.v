(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_028.
Definition enc_88 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_88 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_88 : forall o, dec_88 (enc_88 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_88 : forall o, enc_88 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_028.

