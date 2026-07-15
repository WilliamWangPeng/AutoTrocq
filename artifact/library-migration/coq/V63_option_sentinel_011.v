(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_011.
Definition enc_11 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_11 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_11 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_11 : forall o : option nat, dec_11 (enc_11 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_11 : forall o : option nat, enc_11 o = size_11 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_11 : forall o : option nat, enc_11 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_011.

