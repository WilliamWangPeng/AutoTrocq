(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_051.
Definition enc_51 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_51 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_51 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_51 : forall o : option nat, dec_51 (enc_51 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_51 : forall o : option nat, enc_51 o = size_51 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_51 : forall o : option nat, enc_51 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_051.

