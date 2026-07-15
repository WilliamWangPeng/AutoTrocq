(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_049.
Definition enc_49 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_49 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_49 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_49 : forall o : option nat, dec_49 (enc_49 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_49 : forall o : option nat, enc_49 o = size_49 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_49 : forall o : option nat, enc_49 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_049.

