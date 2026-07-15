(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_004.
Definition enc_4 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_4 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_4 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_4 : forall o : option nat, dec_4 (enc_4 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_4 : forall o : option nat, enc_4 o = size_4 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_4 : forall o : option nat, enc_4 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_004.

