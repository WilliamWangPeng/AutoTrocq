(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_027.
Definition enc_27 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_27 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_27 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_27 : forall o : option nat, dec_27 (enc_27 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_27 : forall o : option nat, enc_27 o = size_27 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_27 : forall o : option nat, enc_27 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_027.

