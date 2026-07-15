(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_059.
Definition enc_59 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_59 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_59 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_59 : forall o : option nat, dec_59 (enc_59 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_59 : forall o : option nat, enc_59 o = size_59 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_59 : forall o : option nat, enc_59 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_059.

