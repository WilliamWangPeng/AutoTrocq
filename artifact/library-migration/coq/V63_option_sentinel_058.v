(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_058.
Definition enc_58 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_58 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_58 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_58 : forall o : option nat, dec_58 (enc_58 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_58 : forall o : option nat, enc_58 o = size_58 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_58 : forall o : option nat, enc_58 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_058.

