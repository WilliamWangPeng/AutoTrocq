(* V64 robustness-matrix module *)
Module V64_REJECT_MISSING_CASE_004.
Definition enc_284 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Theorem bad_none_284 : forall n, enc_284 (Some n) = 0.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_MISSING_CASE_004.

