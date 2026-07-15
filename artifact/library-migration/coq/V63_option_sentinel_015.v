(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_015.
Definition enc_15 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_15 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_15 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_15 : forall o : option nat, dec_15 (enc_15 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_15 : forall o : option nat, enc_15 o = size_15 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_15 : forall o : option nat, enc_15 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_015.

