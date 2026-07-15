(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_063.
Definition enc_63 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_63 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_63 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_63 : forall o : option nat, dec_63 (enc_63 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_63 : forall o : option nat, enc_63 o = size_63 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_63 : forall o : option nat, enc_63 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_063.

