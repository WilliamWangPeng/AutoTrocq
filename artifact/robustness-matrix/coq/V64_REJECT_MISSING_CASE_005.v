(* V64 robustness-matrix module *)
Module V64_REJECT_MISSING_CASE_005.
Definition enc_285 (o : option nat) : nat := match o with None => 0 | Some n => S n end.
Theorem bad_none_285 : forall n, enc_285 (Some n) = 0.
Proof. intro n; reflexivity. Qed.
End V64_REJECT_MISSING_CASE_005.

