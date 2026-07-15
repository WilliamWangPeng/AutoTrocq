(* V64 robustness-matrix module *)
Module V64_ACCEPT_OPTION_SENTINEL_049.
Definition enc_109 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Definition dec_109 (n : nat) : option nat := match n with 0 => None | S k => Some k end.
Theorem roundtrip_109 : forall o, dec_109 (enc_109 o) = o.
Proof. destruct o; reflexivity. Qed.
Theorem none_zero_109 : forall o, enc_109 o = 0 -> o = None.
Proof. destruct o; simpl; congruence. Qed.
End V64_ACCEPT_OPTION_SENTINEL_049.

