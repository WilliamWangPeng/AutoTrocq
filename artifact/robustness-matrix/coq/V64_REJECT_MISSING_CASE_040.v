(* V64 robustness-matrix module *)
Module V64_REJECT_MISSING_CASE_040.
Definition enc_320 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Theorem bad_none_320 : forall n, enc_320 (Some n) = 0.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_MISSING_CASE_040.

