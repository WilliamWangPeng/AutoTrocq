(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_064.
Definition enc_64 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_64 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_64 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_64 : forall o : option nat, dec_64 (enc_64 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_64 : forall o : option nat, enc_64 o = size_64 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_64 : forall o : option nat, enc_64 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_064.

