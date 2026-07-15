(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_031.
Definition enc_91 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_91 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_91 : forall o, dec_91 (enc_91 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_91 : forall o, enc_91 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_031.

