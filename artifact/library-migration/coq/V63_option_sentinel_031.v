(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_031.
Definition enc_31 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_31 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_31 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_31 : forall o : option nat, dec_31 (enc_31 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_31 : forall o : option nat, enc_31 o = size_31 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_31 : forall o : option nat, enc_31 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_031.

