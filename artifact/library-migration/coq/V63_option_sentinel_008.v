(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_008.
Definition enc_8 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_8 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_8 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_8 : forall o : option nat, dec_8 (enc_8 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_8 : forall o : option nat, enc_8 o = size_8 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_8 : forall o : option nat, enc_8 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_008.

