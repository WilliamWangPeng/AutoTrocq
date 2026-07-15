(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_027.
Definition enc_87 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_87 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_87 : forall o, dec_87 (enc_87 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_87 : forall o, enc_87 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_027.

