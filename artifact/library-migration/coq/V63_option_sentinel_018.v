(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_018.
Definition enc_18 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_18 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_18 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_18 : forall o : option nat, dec_18 (enc_18 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_18 : forall o : option nat, enc_18 o = size_18 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_18 : forall o : option nat, enc_18 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_018.

